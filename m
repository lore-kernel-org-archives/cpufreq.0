From: paul.devriendt@amd.com
Subject: RE: Geode NX PowerNow
Date: Mon, 24 May 2004 08:55:20 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C139B0506@txexmtae.amd.com>
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
To: davej@redhat.com, linux@dominikbrodowski.de
Cc: cpufreq@www.linux.org.uk

> "The NX 1500@6W processor leverages Mobile AMD Athlon(tm) 
> processor technology"  Sounds like powernow-k7 should work 
> with some small modifications. I'll bet as long as BIOS has 
> the right tables, it'll just be a trivial modification to the 
> cpuid detection routine.
> 
> 	Dave

It is indeed an Athlon, in an embedded package. The powernow-k7
driver ought to work. I will try to dig up the cpuid info to 
make sure the detection code accepts it. 

Dominik has a good point about the documentation explaining
the different AMD processors ... I'll write up something.

Paul.
