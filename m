From: paul.devriendt@amd.com
Subject: RE: [PATCH] Re: ACPI / cpufreq on Presario R3120
Date: Sat, 5 Jun 2004 12:22:25 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1431BB78@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux@dominikbrodowski.de, khughes@pacific.edu
Cc: davej@redhat.com, ducrot@poupinou.org, Cpufreq@www.linux.org.uk

> > powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
> > powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
> > powernow-k8: cpu_init done, current fid 0x8, vid 0x6
> 
> So you only get two P-States? Paul, does this look OK?
> 
> 	Dominik

It might be correct :)

Processors that have a max frequency of 1600 MHz will indeed only have
2 pstates. Without knowing the part number, I can not tell what the max
frequency for this part is, or whether the corresponding voltages are
correct or not.

Paul.
