From: mark.langsdorf@amd.com
Subject: RE: Panic booting livecd dual opteron powernow
Date: Mon, 13 Sep 2004 08:06:55 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A843AA1A32@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_000_01C49990.665703EE"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: mickreed@freeshell.org, cpufreq@www.linux.org.uk

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C49990.665703EE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> I am booting the 2004.2 Gentoo livecd and get a panic.  I use the smp 
> kernel, and I have tried turning off ACPI and /or APM in my 
> bios.  Also I have tried different kernl arguments, but it still panics.
> 
> noacpi acpi=0 noapm   none of these have helped...
> 
> I can however boot the UP version.  Snippets 
> transcribed below.  Tyan S2881 with latest bios, dual opteron 
> 246.  Any other info I can send let me know.
> 
> smp 'dmesg':
> 
> powernow-k8: Found 2 AMD Athlon 64 / Opteron processors 
> (version 1.20.08b - March 20, 2004)
> powernow-k8: MP systems not supported by PSB BIOS structure 
> Unable to handle kernel NULL pointer dereference at 
> 0000000000000028 RIP: <ffffffff80120ada>{powernowk8_verify+10}PML4 0
> Oops: 0000 [1] SMP
> CPU 0
> Pid: 1, comm: swapper Not tainted 2.6.5-gentoo-smp
> ...
> Call Trace:<fffffff803b0950>{__cpufreq_set_policy+48} 
> <fffffff803b0acf>{cpufreq_set_policy+79}
> ...{cpufreq_add_dev+446}..
> {sysdev_driver_register+135}...
> {powernowk8_init+507}... {do_initcalls+106}... {init+87} 
> ...{child_rip+8} {init+0}... {child_rip+0}...

That's not supposed to happen.  The driver should fail to load.

It looks like what is happening is the call to powernowk8_init
is succeeding, but the call to powernowk8_init_cpu fails.
Then, when powernowk8_verify is called, it tries to dereference
the global data structure, which is NULL.

The attached patch should at least stop the crashing.  I still
am not sure why the .verify method is called after the .init
method fails.

-Mark Langsdorf
AMD, Inc.

--- linux-pn_dev/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.new	2004-09-13 08:05:14.428962032 -0500
+++ linux-pn_dev/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-09-13 08:06:07.819845384 -0500
@@ -927,7 +927,11 @@ err_out:
 /* Driver entry point to verify the policy and range of frequencies */
 static int powernowk8_verify(struct cpufreq_policy *pol)
 {
-	struct powernow_k8_data *data = powernow_data[pol->cpu];
+	struct powernow_k8_data *data;
+	if (powernow_data && pol)
+		data = powernow_data[pol->cpu];
+	else
+		return -EINVAL;
 
 	return cpufreq_frequency_table_verify(pol, data->powernow_table);
 }


------_=_NextPart_000_01C49990.665703EE
Content-Type: application/octet-stream; name=powernow-k8_bad_verify_fix.patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=powernow-k8_bad_verify_fix.patch

--- linux-pn_dev/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.new	=
2004-09-13 08:05:14.428962032 -0500=0A=
+++ linux-pn_dev/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-09-13 =
08:06:07.819845384 -0500=0A=
@@ -927,7 +927,11 @@ err_out:=0A=
 /* Driver entry point to verify the policy and range of frequencies =
*/=0A=
 static int powernowk8_verify(struct cpufreq_policy *pol)=0A=
 {=0A=
-	struct powernow_k8_data *data =3D powernow_data[pol->cpu];=0A=
+	struct powernow_k8_data *data;=0A=
+	if (powernow_data && pol)=0A=
+		data =3D powernow_data[pol->cpu];=0A=
+	else=0A=
+		return -EINVAL;=0A=
 =0A=
 	return cpufreq_frequency_table_verify(pol, data->powernow_table);=0A=
 }=0A=

------_=_NextPart_000_01C49990.665703EE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_000_01C49990.665703EE--


