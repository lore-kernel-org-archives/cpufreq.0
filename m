From: paul.devriendt@amd.com
Subject: RE: [PATCH ] Add documentation on AMD powernow drivers
Date: Thu, 10 Jun 2004 14:50:18 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C14642BC4@txexmtae.amd.com>
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
To: davej@redhat.com
Cc: cpufreq@www.linux.org.uk

 
> The fact that 'Athlon' appears in both may be confusing to 
> some readers.
> Can this be further qualified ?   Athlon (family 15) or the 
> like maybe?
> Is the marketing name for those 32bit k8's just going to be athlon,
> and not athlon-something? 
> 
> 	Dave

I am afraid not ... the -something is not sufficient to tell. 
You need to go to the cpuid values, or look up the product number.
You need code to get the cpuid value, and the product number is
under the heat sink.

If you do not know, you have to try both drivers, and rely on the
cpuid checking in the driver.

Paul.
