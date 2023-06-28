package ch.epfl.scala.bsp4j

import org.eclipse.lsp4j.generator.JsonRpcData
import org.eclipse.lsp4j.jsonrpc.validation.NonNull

@JsonRpcData
class TextDocumentIdentifier {
    @NonNull
    String uri

    new(@NonNull String uri) {
        this.uri = uri
    }
}
