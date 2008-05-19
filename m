From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: acpi_cpufreq stepping issue on Pentium M 1.2GHz
Date: Mon, 19 May 2008 09:14:02 -0400
Message-ID: <20080519131402.GB11313@codemonkey.org.uk>
References: <482DCF52.6030307@awtrey.com>
	<20080519000810.GA11313@codemonkey.org.uk>
	<483164AD.9070905@awtrey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <483164AD.9070905@awtrey.com>
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
To: "Anthony L. Awtrey" <tony@awtrey.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, May 19, 2008 at 07:29:49AM -0400, Anthony L. Awtrey wrote:
> On 05/18/2008 08:08 PM, Dave Jones wrote:
>> On Fri, May 16, 2008 at 02:15:46PM -0400, Anthony L. Awtrey wrote:
>>  > Hi,
>>  >  > I've been trying to get the acpi_cpufreq working on my Panasonic  
>>  > Toughbook CF-18 (Intel Pentium M 1.2GHz). It works just fine on my 
>> CF-19  > (Intel Core Duo U2400) just fine.
>>  >  > When I am on wall power, the system runs at full speed (1.2GHz) 
>> and when  > I pull it off wall power it steps to 600MHz and nothing I 
>> have tried  > changes that. I need to be able to run full speed while 
>> on battery.
>>
>> Some BIOSes take away P states when theres a transition in power source.
>> Nothing much we can do about it.  Check if your BIOS has an option to
>> let this be 'OS controlled', as opposed to 'automatic' or similar wording.
>
> Even though the CPU stepped properly using the speedstep-centrino module  
> in older kernels like the 2.6.18?

That was probably hitting the MSRs directly instead of using the acpi methods.
It's situations like this that make me think we'll never really be able
to get rid of speedstep-centrino.

	Dave

-- 
http://www.codemonkey.org.uk
