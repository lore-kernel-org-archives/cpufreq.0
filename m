From: Michael Prokop <mika@grml.org>
Subject: powernow-k7 does not work with 2.6.12 and SMP enabled
Date: Sat, 30 Jul 2005 13:02:45 +0200
Message-ID: <2005-07-30T12-45-38@devnull.michael-prokop.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Hello,

(please CC me on replies as I'm not subscribed to the list, thanks.)

Compiling 2.6.12.3 with SMP-support *enabled* leads to a non-working
powernow-k7-module on my laptop using mobile AMD Duron(tm) ["Error
inserting powernow_k7 ... No such device"].

Disabling SMP-support results in a working module ["powernow:
Minimum speed 500 MHz. Maximum speed 1100 MHz."].

I do know that there are some issues with enabled SMP, but:
powernow-k7 works for me with 2.6.11 and *enabled* SMP.

Is there a specific reason why it does not work with 2.6.12 anymore?
Using the nosmp-kernelparameter (tell an SMP kernel to act as a UP
kernel) does not change the situation. Why does not the system
behave then like a kernel without SMP-support?

Relevant diff-output of dmesg booting once with a non-smp-kernel
(dmesg.2.6.12.3) and once with a smp-enabled kernel
(dmesg.2.6.12.3-smp):

      --- dmesg.2.6.12.3      2005-07-30 12:23:56.000000000 +0200
      +++ dmesg.2.6.12.3-smp  2005-07-30 12:27:01.000000000 +0200
      -Detected 1100.559 MHz processor.
      +Detected 1100.268 MHz processor.
      [...]
       Intel machine check architecture supported.
       Intel machine check reporting enabled on CPU#0.
      -CPU: AMD mobile AMD Duron(tm) stepping 02
       Enabling fast FPU save and restore... done.
       Enabling unmasked SIMD FPU exception support... done.
       Checking 'hlt' instruction... OK.
       ACPI: setting ELCR to 0200 (from 0620)
      +CPU0: AMD mobile AMD Duron(tm) stepping 02
      +SMP motherboard not detected.
      +Local APIC not detected. Using dummy APIC emulation.
      +Brought up 1 CPUs
      +CPU0 attaching sched-domain:
      + domain 0: span 0001
      +  groups: 0001
      +  domain 1: span 0001
      +   groups: 0001
       NET: Registered protocol family 16
      [...]
      [...]
       powernow: PowerNOW! Technology present. Can scale: frequency and vol=
tage.
      -Detected 1100.387 MHz processor.
      -powernow: SGTC: 10000
      -powernow: Minimum speed 500 MHz. Maximum speed 1100 MHz.


Any chances that powernow(-k7) will work again with SMP-enabled
kernels? (I'd like to ship a smp-enabled kernel with my
linux-live-cd but use cpufreq anyway.)

More detailed information (dmesg-output, kernelconfig, cpuinfo) can
be found on http://grml.org/cpufreq/

I'd appreciate any feedback/help.

regards,
-mika-
--=20
 ,'"`.         http://www.michael-prokop.at/
(  grml.org -=BB Linux for texttool-users and sysadmins
 `._,'         http://www.grml.org/
