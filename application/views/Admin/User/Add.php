<?php
    $this->session->flashdata('pesan');
?>
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <a hreff="<?= base_url('index.php/Admin/Kamar/') ?>">
                    <button class="btn btn-warning btn-md pull-right">
                        <li class="fa fa-undo"></li> Kembali
                    </button>
                </a>
            </div>
            <div class="box-body">
            <form action="<?= base_url() ?>index.php/Admin/User/Add" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Nama User</label>
                        <input type="text" class="form form-control" name="namauser">
                        <div class="text-danger"><?= form_error('namauser') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Nama User</label>
                        <select name="jk" id="jk" class="form form-control">
                            <option value="">-- JENIS KELAMIN --</option>
                            <option value="laki-laki">LAKI-LAKI</option>
                            <option value="perempuan">PEREMPUAN</option>
                        </select>
                        <div class="text-danger"><?= form_error('jk') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Alamat</label>
                        <input type="text" class="form form-control" name="alamat">
                        <div class="text-danger"><?= form_error('alamat') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Nomor Telepon</label>
                        <input type="text" class="form form-control" name="notelepon">
                        <div class="text-danger"><?= form_error('notelepon') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form form-control" name="username">
                        <div class="text-danger"><?= form_error('username') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form form-control" name="password">
                        <div class="text-danger"><?= form_error('password') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <select name="role" id="role" class="form form-control">
                            <option value="">-- ROLE --</option>
                            <option value="ADMIN">ADMIN</option>
                            <option value="RECEPTIONIST">RECEPTIONIST</option>
                        </select>
                        <div class="text-danger"><?=form_error('role') ?></div>
                    </div>
                    <div class="form-group">
                        <label>Picture / Gambar</label>
                        <input type="file" class="form form-control" name="galery">
                        <div class="text-danger"><?= form_error('galery') ?></div>
                    </div>
                    <div class="for-group">
                        <button class="btn btn-primary bt-md" type="submit">SIMPAN</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

