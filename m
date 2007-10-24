From: "Kwon, Owen" <owen.kwon@intel.com>
Subject: RE: Enabling CPU freq in a new CPU
Date: Wed, 24 Oct 2007 09:54:47 +0900
Message-ID: <9981749032FE174C9F521A11BDEEBDFC4C4906@jpsmsx411.gar.corp.intel.com>
References: <9981749032FE174C9F521A11BDEEBDFC4C4774@jpsmsx411.gar.corp.intel.com>
	<471DEC97.4070705@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <471DEC97.4070705@redhat.com>
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
To: Jarod Wilson <jwilson@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Acpi-cpufreq works with my CPU.
Thank you. :)

-----Original Message-----
From: Jarod Wilson [mailto:jwilson@redhat.com] 
Sent: Tuesday, October 23, 2007 9:44 PM
To: Kwon, Owen
Cc: cpufreq@lists.linux.org.uk
Subject: Re: Enabling CPU freq in a new CPU

Kwon, Owen wrote:
> I am testing speedstep function with newer Intel CPU. Kernel option is
> enabled at compile time, but while booting, CPUID check seemed to
fail.
> The message is
> 
> "p4-clockmod : Unknown p4-clockmod-capable CPU ~~~"
> 
> 
> Do I need to implement additional code to test this function? Or is it
> safe to bypass the CPUID check part?
> 
> 
> I don't know this is required, but Kernel version is 2.6.22.

p4-clockmod is for much older p4 processors, and even then, often isn't
recommended for use. What you want for any reasonably new intel
processor is acpi-cpufreq, not p4-clockmod.

-- 
Jarod Wilson
jwilson@redhat.com
