From: Giuseppe Ponzio <g.ponzio@vodafone.it>
Subject: Re: Pentium Cetrino
Date: Sun, 12 Jun 2005 12:16:15 +0200
Message-ID: <200506121216.15940.g.ponzio@vodafone.it>
References: <200506121014.41734.g.ponzio@vodafone.it>
	<20050612082200.GA17230@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050612082200.GA17230@isilmar.linta.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

hi, thx for reply!
just a question: does the acpi-cpufreq module give me the features of 
speedstep enhanced? i'm talking about frequency and voltage modulation.

In the other way i'd must have a bios version exporting all the relevant data 
to use speedstep-centrino.. am i right?

thx again and bye!!

Alle 10:22, domenica 12 giugno 2005, Dominik Brodowski ha scritto:
> Hi,
>
> > I'm totally able to use p4-clockmod and/or acpi-cpufreq with each
> > governor i prefer.... why this problem with speedstep-centrino?
>
> Most probably the BIOS of your notebook does not export the relevant data
> necessary to use speedstep-centrino. Therefore, you should use acpi-cpufreq
> instead (and not p4-clockmod).
>
> 	Dominik
