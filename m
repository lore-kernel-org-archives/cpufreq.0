From: "Kwon, Owen" <owen.kwon@intel.com>
Subject: Enabling CPU freq in a new CPU
Date: Tue, 23 Oct 2007 15:04:28 +0900
Message-ID: <9981749032FE174C9F521A11BDEEBDFC4C4774@jpsmsx411.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Hello

 

I am testing speedstep function with newer Intel CPU. Kernel option is
enabled at compile time, but while booting, CPUID check seemed to fail.
The message is

"p4-clockmod : Unknown p4-clockmod-capable CPU ~~~"

 

Do I need to implement additional code to test this function? Or is it
safe to bypass the CPUID check part?

 

I don't know this is required, but Kernel version is 2.6.22.

 

Thanks,

Owen

 

Owen Kwon (Ohkeun Kwon)

Technical Marketing Engineer

+82 2 767 2428 (Office)

+82 10 9034 4820 (Mobile)
