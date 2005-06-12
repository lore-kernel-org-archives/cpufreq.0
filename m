From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Pentium Cetrino
Date: Sun, 12 Jun 2005 10:22:00 +0200
Message-ID: <20050612082200.GA17230@isilmar.linta.de>
References: <200506121014.41734.g.ponzio@vodafone.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200506121014.41734.g.ponzio@vodafone.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Ponzio <g.ponzio@vodafone.it>
Cc: cpufreq@lists.linux.org.uk

Hi,

> I'm totally able to use p4-clockmod and/or acpi-cpufreq with each governor i 
> prefer.... why this problem with speedstep-centrino? 

Most probably the BIOS of your notebook does not export the relevant data
necessary to use speedstep-centrino. Therefore, you should use acpi-cpufreq
instead (and not p4-clockmod).

	Dominik
