From: Rob Hess <robwhess@gmail.com>
Subject: Can't use speedstep_ich driver w/ p4m
Date: Mon, 28 Nov 2005 14:54:17 -0800
Message-ID: <8dff05a00511281454y7647c951rbe0f38000f5f77a9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi,
     It is my understanding that the correct cpufreq driver to use with a
Mobile Pentium 4 processor is speedstep_ich.  However, I am having some
problems with using speedstep_ich.  Below is the result of trying to insert
the speedstep_ich.ko module:

krusty hess # modprobe speedstep_ich
FATAL: Error inserting speedstep_ich
(/lib/modules/2.6.14-gentoo-r2/kernel/arch/i386/kernel/cpu/cpufreq/speedste=
p-
ich.ko): No such device

I have a 2.80 GHz P4M on an ICH4 rev 3 chipset.  I've had to revert to usin=
g
the acpi-cpufreq driver, but I'm not sure that that scales the processor's
voltage correctly, since my CPU heats up quite a bit (60-70+ C) even when
I'm not doing anything computationally expensive.

Can anyone offer any advice on this problem?

Thanks.
Rob Hess
