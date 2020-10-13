
SOLC_ABI=solc --abi --output-dir ./abi --overwrite --optimize-runs $(OPTIMIZATION)
SOLC_BIN=solc --bin --output-dir ./bin --overwrite --optimize-runs $(OPTIMIZATION)
OPTIMIZATION=2000

all: proxy aave bzx dydx runner
	
clean:
	rm -r ./bin && rm -r ./abi

proxy:
	$(SOLC_ABI) ./TransactionProxy.sol && $(SOLC_BIN) ./TransactionProxy.sol

aave:
	$(SOLC_ABI) ./aaveFlashLoan.sol && $(SOLC_BIN) ./aaveFlashLoan.sol

bzx:
	$(SOLC_ABI) ./bZxFlashLoan.sol && $(SOLC_BIN) ./bZxFlashLoan.sol

dydx:
	$(SOLC_ABI) ./dydxFlashLoan.sol && $(SOLC_BIN) ./dydxFlashLoan.sol

runner:
	$(SOLC_ABI) ./ScriptRunner.sol && $(SOLC_BIN) ./ScriptRunner.sol
