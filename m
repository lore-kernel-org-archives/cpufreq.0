From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand vs suspend.
Date: Tue, 13 Jun 2006 16:03:12 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454110A57@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk
Cc: pjones@redhat.com


Is this with 2.6.16 based kernel?

Andi pushed in a patch to fix this recently=20
Here -
http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
c
ommit;h=3D6810b548b25114607e0814612d84125abccc0a4f


Thanks,
Venki=20

>-----Original Message-----
>From: Dave Jones [mailto:davej@redhat.com]=20
>Sent: Tuesday, June 13, 2006 1:53 PM
>To: cpufreq@lists.linux.org.uk
>Cc: Pallipadi, Venkatesh; pjones@redhat.com
>Subject: ondemand vs suspend.
>
>Here's a puzzling case that Peter stumbled across when experimenting
>with suspend on one of the new dual-core Intel-based Mac Mini's.
>
>The hibernate process would just lock up, and never shut down.
>
> 4190 ?        S<     0:00  \_ [kstopmachine]
> 4191 ?        Z<     0:00      \_ [kstopmachine] <defunct>
> =20
>dmesg showed that we had offlined the 2nd core..
>
>PM: suspend-to-disk mode set to 'platform'
>Freezing cpus ...
>Breaking affinity for irq 0
>Breaking affinity for irq 14
>Breaking affinity for irq 217
>Breaking affinity for irq 225
>CPU 1 is now offline
>SMP alternatives: switching to UP code
>
>and sysrq-t showed that we were erm.. spinning.
>
>ondemand      D EDDD1300  3452  1462     11          2160  1345 (L-TLB)
>       f7f8eec0 f7f8eef4 f7f8eef4 eddd1300 003d10ba c05a4c2c=20
>0000000a f7eb4fcc
>       f7eb4eb0 c06e0c00 c19c4860 eddd1300 003d10ba 00000000=20
>00000000 00000000
>       f7f8eedc c041fc12 00000296 ffffffff f7f8eef4 00000246=20
>00000246 c06e65d8
>Call Trace:
> <c0607f89> __down+0x131/0x14a  <c0605432> __down_failed+0xa/0x10
> <c043aa55> .text.lock.cpu+0x2b/0x32  <c043a7ad>=20
>lock_cpu_hotplug+0xa/0xc
> <c05a3dae> __cpufreq_driver_target+0x15/0x6d  <f8bce3da>=20
>do_dbs_timer+0x229/0x287 [cpufreq_ondemand]
> <c04321fb> run_workqueue+0x81/0xc0  <c0432c35>=20
>worker_thread+0xce/0x101
> <c0435353> kthread+0xa3/0xd0  <c0402005> kernel_thread_helper+0x5/0xb
>pm-hibernate  D F395EB00  1816  3934   2495                     (NOTLB)
>       e632ade8 c0465c6c 00000004 f395eb00 003d10ba f2c31800=20
>00000007 ddc7e44c
>       ddc7e330 c1b1b190 c19c4860 f395eb00 003d10ba 00000000=20
>00000000 c0481c9c
>       f8bcfa40 f8bcfa40 e632a000 e632adf8 00000000 c0438ad8=20
>f8bce646 f8bcfa54
>Call Trace:
> <c06075ba> __mutex_lock_slowpath+0x19b/0x3e3  <c0607826>=20
>mutex_lock+0x24/0x27
> <f8bce646> cpufreq_governor_dbs+0x20e/0x2b0=20
>[cpufreq_ondemand]  <c05a385f> __cpufreq_governor+0x57/0xd8
> <c05a4106> cpufreq_remove_dev+0x197/0x208  <c05a4716>=20
>cpufreq_cpu_callback+0x49/0x52
> <c0609795> notifier_call_chain+0x18/0x29  <c042f9da>=20
>blocking_notifier_call_chain+0x37/0x4f
> <c043a98d> cpu_down+0x12b/0x1c8  <c04420b0>=20
>disable_nonboot_cpus+0x35/0xa1
> <c043fc93> prepare_processes+0x13/0x3b  <c043fedd>=20
>pm_suspend_disk+0x9/0xf3
> <c043eead> enter_state+0x53/0x1c1  <c043f0a1> state_store+0x86/0x9c
> <c04a4d14> subsys_attr_store+0x20/0x25  <c04a4e18>=20
>sysfs_write_file+0xab/0xd1
> <c046b25c> vfs_write+0xab/0x154  <c046b890> sys_write+0x3b/0x60
> <c060837f> syscall_call+0x7/0xb
>kstopmachine  S ED25F800  3428  4190     11  4191          2160 (L-TLB)
>       dc184fac c19c4860 c04f473a ed25f800 003d10ba c041115b=20
>00000003 f7e38e4c
>       f7e38d30 c1acf050 c19cc860 ed25f800 003d10ba 00000000=20
>00000001 00000246
>       e632ae94 dc184f90 00000246 e632ae90 00000000 c041ee49=20
>00000000 00000000
>Call Trace:
> <c044579f> do_stop+0xf9/0x129  <c0435353> kthread+0xa3/0xd0
> <c0402005> kernel_thread_helper+0x5/0xb
>kstopmachine  X ED25F800  3736  4191   4190                     (L-TLB)
>       f7ecefb4 c0605fda f7ecef78 ed25f800 003d10ba 003d10ba=20
>00000002 f2e622cc
>       f2e621b0 ddc7e330 c19c4860 ed25f800 003d10ba 00000000=20
>00000000 00000000
>       f7ecef94 00000202 00000202 f2ec1ad8 00000000 c0608093=20
>f7ecefb4 00000202
>Call Trace:
> <c0427428> do_exit+0x7a1/0x7ab  <c040200b>=20
>kernel_thread_helper_end+0x0/0xe
>
>D    pm-hibernate: 3934 [ddc7e330, 118] blocked on mutex:=20
>[f8bcfa40] {dbs_mutex}
>.. held by:          ondemand: 1462 [f7eb4eb0, 110]
>... acquired at:               do_dbs_timer+0x13/0x287=20
>[cpufreq_ondemand]
>
>
>This doesn't happen if the govenor is 'userspace', so I'm wondering if
>we're doing something silly in ondemand when we've offlined a CPU.
>
>Any ideas ?
>
>		Dave
>
>--=20
>http://www.codemonkey.org.uk
>
