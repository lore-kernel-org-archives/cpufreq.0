From: "Anthony L. Awtrey" <tony@awtrey.com>
Subject: Re: acpi_cpufreq stepping issue on Pentium M 1.2GHz
Date: Wed, 21 May 2008 08:51:04 -0400
Message-ID: <48341AB8.3090401@awtrey.com>
References: <482DCF52.6030307@awtrey.com>	
	<20080519000810.GA11313@codemonkey.org.uk>
	<1211279939.21269.403.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1211279939.21269.403.camel@queen.suse.de>
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
To: trenn@suse.de
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk

On 05/20/2008 06:38 AM, Thomas Renninger wrote:
> It could be that you hit a bug that might get fixed with a recent
> commit:
> commit e56a727b023d40d1adf660168883f30f2e6abe0a
> Author: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> Date:   Mon Apr 28 15:13:43 2008 -0400
> 
>     [CPUFREQ] Make acpi-cpufreq more robust against BIOS freq changes
> behind our back.

Hi,

Sorry for the public display of ignorance, but I can't seem to find this 
patch as a simple diff so I can test it in one of my vanilla kernel 
builds (either 2.6.24.2 or 2.6.25.4, please). Can you provide me a 
general patch or some example git commands to get a build-able source tree?

Tony
