    typedef enum logic [1:0] {
        ST_IDLE = 2'd0,
        ST_WORK = 2'd1,
        ST_DONE = 2'd2
    } state_t;

    state_t cur_state;
    state_t nxt_state;

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            cur_state <= ST_IDLE;
        end else begin
            cur_state <= nxt_state;
        end
    end

    always_comb begin
        nxt_state = cur_state;
        unique case (cur_state)
            ST_IDLE: begin
                nxt_state = ST_WORK;
            end
            ST_WORK: begin
                nxt_state = ST_DONE;
            end
            ST_DONE: begin
                nxt_state = ST_IDLE;
            end
            default: begin
                nxt_state = ST_IDLE;
            end
        endcase
    end

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin

        end else begin
            unique case (nxt_state)
                ST_IDLE: begin

                end
                ST_WORK: begin

                end
                ST_DONE: begin

                end
                default: begin

                end
            endcase
        end
    end
