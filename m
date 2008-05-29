From: =?iso-8859-15?q?Lothar_Wa=DFmann?= <LW@KARO-electronics.de>
Subject: [PATCH] fix double unlock of cpu_policy_rwsem in
	drivers/cpufreq/cpufreq.c
Date: Thu, 29 May 2008 17:54:52 +0200
Message-ID: <18494.53708.856316.841696@ipc1.ka-ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="macroman"
To: cpufreq@lists.linux.org.uk
Cc: davej@codemonkey.org.uk

Hi,

[this message was also sent to the linux-kernel mailing list]

In drivers/cpufreq/cpufreq.c the function cpufreq_add_dev() takes the
error exit 'err_out_unregister' from different places once with the
'cpu_policy_rwsem' lock held, once with the lock released:
|		if (ret)
|			goto err_out_unregister;
|	}
|
|	policy->governor =3D NULL; /* to assure that the starting sequence is
|				  * run in cpufreq_set_policy */
|
|	/* set default policy */
|	ret =3D __cpufreq_set_policy(policy, &new_policy);
|	policy->user_policy.policy =3D policy->policy;
|	policy->user_policy.governor =3D policy->governor;
|
|	unlock_policy_rwsem_write(cpu);
|
|	if (ret) {
|		dprintk("setting policy failed\n");
|		goto err_out_unregister;
|	}

This leads to the following error message in case of a failing
__cpufreq_set_policy() call:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ BUG: bad unlock balance detected! ]
-------------------------------------
swapper/1 is trying to release lock (&per_cpu(cpu_policy_rwsem, cpu)) at:
[<c01b4564>] unlock_policy_rwsem_write+0x30/0x40
but there are no more locks to release!

other info that might help us debug this:
1 lock held by swapper/1:
 #0:  (sysdev_drivers_lock){--..}, at: [<c018fd18>] sysdev_driver_register+=
0x74/0x130

stack backtrace:
[<c002f588>] (dump_stack+0x0/0x14) from [<c00692fc>] (print_unlock_inbalanc=
e_bug+0xc8/0x104)
[<c0069234>] (print_unlock_inbalance_bug+0x0/0x104) from [<c006b7ac>] (lock=
_release_non_nested+0xc4/0x19c)
 r6:00000028 r5:c3c1ab80 r4:c01b4564
[<c006b6e8>] (lock_release_non_nested+0x0/0x19c) from [<c006b9e0>] (lock_re=
lease+0x15c/0x18c)
 r8:60000013 r7:00000001 r6:c01b4564 r5:c0541bb4 r4:c3c1ab80
[<c006b884>] (lock_release+0x0/0x18c) from [<c0061ba0>] (up_write+0x24/0x30)
 r8:c0541b80 r7:00000000 r6:ffffffea r5:c3c34828 r4:c0541b8c
[<c0061b7c>] (up_write+0x0/0x30) from [<c01b4564>] (unlock_policy_rwsem_wri=
te+0x30/0x40)
 r4:c3c34884
[<c01b4534>] (unlock_policy_rwsem_write+0x0/0x40) from [<c01b4c40>] (cpufre=
q_add_dev+0x324/0x398)
[<c01b491c>] (cpufreq_add_dev+0x0/0x398) from [<c018fd64>] (sysdev_driver_r=
egister+0xc0/0x130)
[<c018fca4>] (sysdev_driver_register+0x0/0x130) from [<c01b3574>] (cpufreq_=
register_driver+0xbc/0x174)

Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
---

--- linux-2.6.26-rc3/drivers/cpufreq/cpufreq.c
+++ linux-2.6.26-rc3-karo/drivers/cpufreq/cpufreq.c
@@ -928,13 +928,13 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	policy->user_policy.policy =3D policy->policy;
 	policy->user_policy.governor =3D policy->governor;
 =

-	unlock_policy_rwsem_write(cpu);
-
 	if (ret) {
 		dprintk("setting policy failed\n");
 		goto err_out_unregister;
 	}
 =

+	unlock_policy_rwsem_write(cpu);
+
 	kobject_uevent(&policy->kobj, KOBJ_ADD);
 	module_put(cpufreq_driver->owner);
 	dprintk("initialization complete\n");
-- =

Lothar Wa=DFmann
