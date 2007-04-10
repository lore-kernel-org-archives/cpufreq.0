From: Federico Giacomini <giacof@tiscali.it>
Subject: Re: speedstep-centrino fails to load
Date: Tue, 10 Apr 2007 16:11:58 +0200 (CEST)
Message-ID: <17149714.1176214318946.JavaMail.root@ps18>
Reply-To: Federico Giacomini <giacof@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

> >You mean the module speedstep-centrino is deprecated now, and 
> >I should use acpi_cpufreq on any Pentium M laptop? Even if my 
> >kernel is 2.6.17?
> >
> 
> No. speedstep centrino is deprated only in 2.6.20 onwards.
> 2.6.17 acpi-cpufreq or speedstep-centrino any one of them can work 
for
> you
> Depending on what your BIOS ACPI support has. So, please try both
> acpi-cpufreq
> and speedstep_centrino (with SPEEDSTEP_CENTRINO_ACPI enabled in 
config).
> If both of them does not work, please go ahead and open a bug at
> bugme.osdl.org
> under ACPI related bugs. We can track the issue down systematically 
that
> way.
> 
> Also, if none of those two drivers work, it will be interesting to 
know
> whether it is a recent regression or it did not work on this 
particular
> system
> with earlier kernels as well.
> 
> Thanks,
> Venki
> 

I am currently using acpi-cpufreq, which seems to work fine. But I 
thought speedstep-centrino was more specific and suited to Centrino 
processors, that's why I was quite concerned about that failure when 
trying to load the module.
So, just a misunderstanding about those two drivers... sorry!

Thank you,
Federico


Naviga e telefona senza limiti con Tiscali     
Scopri le promozioni Tiscali adsl: navighi e telefoni senza canone Telecom

http://abbonati.tiscali.it/adsl/
