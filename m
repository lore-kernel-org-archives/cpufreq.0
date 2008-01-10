From: Johannes Berg <johannes@sipsolutions.net>
Subject: lockup with cpufreq (2.6.24-rc7)
Date: Thu, 10 Jan 2008 18:54:51 +0100
Message-ID: <1199987691.3861.95.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1670073303=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq <cpufreq@lists.linux.org.uk>


--===============1670073303==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-hd3lzBZv9iAXZ8DKGEKR"


--=-hd3lzBZv9iAXZ8DKGEKR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I'm seeing what seems to be a lockup in cpufreq, I have four processes
stuck in D:

[ 1091.370746]   task                        PC stack   pid father
[ 1091.384390] kwindfarm     D 0000000000000000     0   888      2
[ 1091.384396] Call Trace:
[ 1091.384402] [c00000011805b210] [0000000000000002] 0x2 (unreliable)
[ 1091.384428] [c00000011805b3e0] [c00000000000ecd4] .__switch_to+0xcc/0x10=
0
[ 1091.384441] [c00000011805b470] [c0000000003a8fc4] .schedule+0x590/0x670
[ 1091.384452] [c00000011805b590] [c0000000003a930c] .schedule_timeout+0x38=
/0xe8
[ 1091.384460] [c00000011805b680] [c0000000003a8900] .wait_for_common+0x10c=
/0x1d4
[ 1091.384469] [c00000011805b750] [c000000000034b54] .smu_i2c_xfer+0x170/0x=
1e8
[ 1091.384478] [c00000011805b830] [c0000000000339ec] .pmac_i2c_xfer+0x38/0x=
4c
[ 1091.384486] [c00000011805b8b0] [c0000000002fc048] .i2c_powermac_smbus_xf=
er+0x254/0x2a4
[ 1091.384496] [c00000011805b970] [c0000000002f8d70] .i2c_smbus_xfer+0xb0/0=
x610
[ 1091.384506] [c00000011805baa0] [c0000000002f957c] .i2c_smbus_read_i2c_bl=
ock_data+0x4c/0x88
[ 1091.384516] [c00000011805bb50] [c0000000002a2c90] .wf_sat_get+0xc8/0x1c0
[ 1091.384526] [c00000011805bc00] [c0000000002a20c4] .pm112_wf_notify+0x904=
/0x1304
[ 1091.384535] [c00000011805bd20] [c000000000069534] .notifier_call_chain+0=
x68/0xdc
[ 1091.384545] [c00000011805bdc0] [c000000000069914] .__blocking_notifier_c=
all_chain+0x70/0xb0
[ 1091.384555] [c00000011805be70] [c0000000002a10b8] .wf_thread_func+0x7c/0=
x11c
[ 1091.384563] [c00000011805bf00] [c000000000063d90] .kthread+0x78/0xc4
[ 1091.384573] [c00000011805bf90] [c000000000022d0c] .kernel_thread+0x4c/0x=
68
[ 1091.384600] powernowd     D 000000000ff51ee4     0  3589      1
[ 1091.384606] Call Trace:
[ 1091.384610] [c000000117dc3580] [c00000000004f36c] .irq_exit+0x5c/0xb0 (u=
nreliable)
[ 1091.384620] [c000000117dc3750] [c00000000000ecd4] .__switch_to+0xcc/0x10=
0
[ 1091.384628] [c000000117dc37e0] [c0000000003a8fc4] .schedule+0x590/0x670
[ 1091.384636] [c000000117dc3900] [c0000000003aaf58] .rwsem_down_failed_com=
mon+0x258/0x2a8
[ 1091.384645] [c000000117dc39c0] [c0000000003aafd0] .rwsem_down_write_fail=
ed+0x28/0x40
[ 1091.384654] [c000000117dc3a70] [c0000000003aa3d8] .down_write+0x5c/0x78
[ 1091.384662] [c000000117dc3af0] [c000000000304590] .lock_policy_rwsem_wri=
te+0x70/0xd4
[ 1091.384672] [c000000117dc3b80] [c000000000304fc4] .store+0x40/0xc0
[ 1091.384680] [c000000117dc3c20] [c000000000120c04] .sysfs_write_file+0x12=
0/0x18c
[ 1091.384691] [c000000117dc3ce0] [c0000000000c897c] .vfs_write+0xd0/0x1a4
[ 1091.384701] [c000000117dc3d80] [c0000000000c9380] .sys_write+0x54/0xa0
[ 1091.384710] [c000000117dc3e30] [c00000000000772c] syscall_exit+0x0/0x40
[ 1091.384761] cpufreq-apple D 000000000f665100     0  4278      1
[ 1091.384767] Call Trace:
[ 1091.384771] [c00000011148b590] [0000000010047f88] 0x10047f88 (unreliable=
)
[ 1091.384779] [c00000011148b760] [c00000000000ecd4] .__switch_to+0xcc/0x10=
0
[ 1091.384788] [c00000011148b7f0] [c0000000003a8fc4] .schedule+0x590/0x670
[ 1091.384796] [c00000011148b910] [c0000000003aaf58] .rwsem_down_failed_com=
mon+0x258/0x2a8
[ 1091.384805] [c00000011148b9d0] [c0000000003ab014] .rwsem_down_read_faile=
d+0x2c/0x44
[ 1091.384814] [c00000011148ba80] [c0000000003aa448] .down_read+0x54/0x70
[ 1091.384821] [c00000011148bb00] [c0000000003050b4] .lock_policy_rwsem_rea=
d+0x70/0xd4
[ 1091.384831] [c00000011148bb90] [c0000000003051d4] .show+0x38/0xb0
[ 1091.384839] [c00000011148bc20] [c000000000120d54] .sysfs_read_file+0xe4/=
0x190
[ 1091.384848] [c00000011148bce0] [c0000000000c8b20] .vfs_read+0xd0/0x1a4
[ 1091.384856] [c00000011148bd80] [c0000000000c92e0] .sys_read+0x54/0xa0
[ 1091.384864] [c00000011148be30] [c00000000000772c] syscall_exit+0x0/0x40
[ 1091.384878] sh            D 000000000fed1ee4     0  4432   4429
[ 1091.384885] Call Trace:
[ 1091.384888] [c00000011170b050] [0000000000000002] 0x2 (unreliable)
[ 1091.384896] [c00000011170b220] [c00000000000ecd4] .__switch_to+0xcc/0x10=
0
[ 1091.384905] [c00000011170b2b0] [c0000000003a8fc4] .schedule+0x590/0x670
[ 1091.384913] [c00000011170b3d0] [c0000000003a930c] .schedule_timeout+0x38=
/0xe8
[ 1091.384921] [c00000011170b4c0] [c0000000003a8900] .wait_for_common+0x10c=
/0x1d4
[ 1091.384929] [c00000011170b590] [c000000000121f70] .sysfs_addrm_finish+0x=
2d4/0x36c
[ 1091.384938] [c00000011170b6c0] [c0000000001201c4] .sysfs_hash_and_remove=
+0x70/0xac
[ 1091.384947] [c00000011170b770] [c000000000120f9c] .sysfs_remove_file+0x1=
8/0x2c
[ 1091.384956] [c00000011170b7f0] [c000000000305f98] .cpufreq_governor_user=
space+0x1c0/0x2d8
[ 1091.384966] [c00000011170b8a0] [c0000000003035ec] .__cpufreq_governor+0x=
bc/0x130
[ 1091.384975] [c00000011170b930] [c000000000303840] .__cpufreq_set_policy+=
0x1e0/0x284
[ 1091.384984] [c00000011170b9e0] [c000000000303a8c] .store_scaling_governo=
r+0x1a8/0x200
[ 1091.384994] [c00000011170bb80] [c000000000305000] .store+0x7c/0xc0
[ 1091.385003] [c00000011170bc20] [c000000000120c04] .sysfs_write_file+0x12=
0/0x18c
[ 1091.385012] [c00000011170bce0] [c0000000000c897c] .vfs_write+0xd0/0x1a4
[ 1091.385020] [c00000011170bd80] [c0000000000c9380] .sys_write+0x54/0xa0
[ 1091.385028] [c00000011170be30] [c00000000000772c] syscall_exit+0x0/0x40
[ 1091.385042] Sched Debug Version: v0.07, 2.6.24-rc7-g6e800de9-dirty #13


Can anyone make sense of this?

kwindfarm is the kernel thread that controls the fans, powernowd is the
userspace cpufreq controller, cpufreq-apple[t] is an applet that
displays the current state and the shell process there is trying to
change to the performance governor.

johannes

--=-hd3lzBZv9iAXZ8DKGEKR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUAR4Zb6qVg1VMiehFYAQJUpQ/+P+HHWRDUWlLXNdAXbxuApEIPO1fh0pvs
z4Yi+Z1Tx49mzKYrUaXuBddD49WlgvzK0fZXtiwF04uBzV3MDuCfdcVXEwyJ7PRB
PN0Q1JA2w57sfVIw7NNRGPRgkDR0FvYHNP6JOTTCc5irkS4GqOFJYdPB8ncQXoZz
g/Va2Bch5KDb4hpGmYmsP0lAuVUurq5Tcr63kvwdbB2apQSFeXpG8RXed3ajJ25v
ttfkurC2MzAKY0Fzb1t116Tv0SdgHVHTsUDxyNWlOizNaI8ubhVIQg8bH8KCkmim
ysgZ/LaorWmxGgJUiPchXGcP1RoV3RhSKeLdnXgPIU/ROd0llzzU6LL8Ry2dC12Q
BrUAPyUJSGO+FZSfy5xrjd3gTS6uR1NJlDrx0ppA9DJ8TNkwe/3NbleM4Lanegkj
IthgLGro1ao6kJIJ326ZcnbguobknhwpxjocRYH0eRaqG3GcDMZ68Pe3a+SJzZ/M
eJt3Jf3Hklcf0axbJWQIhZXD5UD3UCD/f7dwjpzKCt+Yes/EfElrN33DXRw38BWq
iz7NfloO6qzGwuxCIBl3BOLdslZdJcfXnjaGBcqWfnxdh6fFOSy6k9eQC7WQVlnT
3SVihVg2/6tUYDhbJcANJWrGX7eAPh2vQaxh6yfYz0M58gizRQo+xLQXWYXHByRP
3KlPdWU4F6Y=
=UbSO
-----END PGP SIGNATURE-----

--=-hd3lzBZv9iAXZ8DKGEKR--



--===============1670073303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1670073303==--


