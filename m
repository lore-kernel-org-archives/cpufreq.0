From: "Anthony L. Awtrey" <tony@awtrey.com>
Subject: Re: acpi_cpufreq stepping issue on Pentium M 1.2GHz
Date: Mon, 19 May 2008 09:38:19 -0400
Message-ID: <483182CB.90101@awtrey.com>
References: <482DCF52.6030307@awtrey.com>
	<20080519000810.GA11313@codemonkey.org.uk>
	<483164AD.9070905@awtrey.com>
	<20080519131402.GB11313@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080519131402.GB11313@codemonkey.org.uk>
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

On 05/19/2008 09:14 AM, Dave Jones wrote:
> On Mon, May 19, 2008 at 07:29:49AM -0400, Anthony L. Awtrey wrote:
>> On 05/18/2008 08:08 PM, Dave Jones wrote:
>>> On Fri, May 16, 2008 at 02:15:46PM -0400, Anthony L. Awtrey wrote:
>>>  > Hi,
>>>  >  > I've been trying to get the acpi_cpufreq working on my Panasonic  
>>>  > Toughbook CF-18 (Intel Pentium M 1.2GHz). It works just fine on my 
>>> CF-19  > (Intel Core Duo U2400) just fine.
>>>  >  > When I am on wall power, the system runs at full speed (1.2GHz) 
>>> and when  > I pull it off wall power it steps to 600MHz and nothing I 
>>> have tried  > changes that. I need to be able to run full speed while 
>>> on battery.
>>>
>>> Some BIOSes take away P states when theres a transition in power source.
>>> Nothing much we can do about it.  Check if your BIOS has an option to
>>> let this be 'OS controlled', as opposed to 'automatic' or similar wording.
>> Even though the CPU stepped properly using the speedstep-centrino module  
>> in older kernels like the 2.6.18?
> 
> That was probably hitting the MSRs directly instead of using the acpi methods.
> It's situations like this that make me think we'll never really be able
> to get rid of speedstep-centrino.

Well, it did work with speedstep-centrino and now it doesn't even load.

# modprobe speedstep-centrino
FATAL: Error inserting speedstep_centrino 
(/lib/modules/2.6.25.4/kernel/arch/x86/kernel/cpu/cpufreq/speedstep-centrino.ko): 
No such device

So what do I need to do to either get the speedstep-centrino working 
again or to get the acpi_cpufreq working?

The CF-18 is running the latest panasonic BIOS, and there are no 
advanced settings related to ACPI or power as you described.

Do I need to run a custom DSDT to fix this? I've had to do that on some 
CF series boxes in the past, but mostly for just fixing ACPI bugs in a 
particular BIOS rev, not changing a feature's implementation.

T
