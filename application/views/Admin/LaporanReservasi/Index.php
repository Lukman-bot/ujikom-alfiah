<?php if ($this->session->flashdata('pesan')) : ?>
    <div class="alert alert-success">
        <?= $this->session->flashdata('pesan') ?>
    </div>
<?php endif ?>

<div class="row">
    <div class="col-md-6">
        <div class="box"> 
            <div class="box-header with-border">
                <h3 class="box-title">Laporan Data Reservasi Per Periode</h3>
            </div>
            <div class="box-body table-responsive">
                <form action="<?= base_url('index.php/Admin/Lapreservasi/Periode') ?>" method="POST">
                    <div class="form-group">
                        <label>Tanggal Awal</label>
                        <input type="date" class="form form-control" required name="tanggalawal">
                    </div>                
                    <div class="form-group">
                        <label>Tanggal Akhir</label>
                        <input type="date" class="form form-control" required name="tanggalakhir">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-lg"> <li class="fa fa-print"></li>Lihat Data</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-6"> 
        <div class="box"> 
            <div class="box-header with-border">
                <h3 class="box-title">Laporan Reservasi Berdasarkan Status</h3>
            </div>
            <div class="box-body table-responsive">
                <form action="<?= base_url('index.php/Admin/Lapreservasi/Perstatus') ?>" method="POST">
                    <div class="form-group">
                        <label>Tanggal</label>
                        <input type="date" class="form form-control" required name="tanggal">
                    </div>                
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" id="status" class="form form-control">
                            <option value="">-- PILIHAN STATUS --</option>
                            <option value="checkin">CHECKIN</option>
                            <option value="checkout">CHECKOUT</option>
                            <option value="cancel">CANCEL</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-lg" type="submit"> 
                            <li class="fa fa-print"></li>Lihat Data
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>