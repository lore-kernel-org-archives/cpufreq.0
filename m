From: Mark Gillespie <email@markgillespie.co.uk>
Subject: Re: 2.6 kernel crashes - cpufreq
Date: Sat, 20 Dec 2003 19:52:19 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FE4A873.3040606@markgillespie.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cpufreq@www.linux.org.uk

I don't have a entry for CONFIG_X86_ACPI_CPUFREQ in my kernel .config
file...

Here is the call stack.... (aploigies if there are errors, as it's
reproduced from a notepad scribble...)

__CPUFREQ_GOVERNOR
__CPUFREQ_SET_POLICY
CPUFREQ_SET_POLICY
CPUFREQ_ADD_DEV
UPDATE_PROCESS_TIMES
REMOVE_VM_AREA
SYSDEV_DRIVER_REGISTER
CPUFREQ_DRIVER_REGISTER
LONGHAUL_INIT
DO_INITCALLS
INIT
INIT
KERNEL_THREAD_HELPER


Dominik Brodowski wrote:
> On Sat, Dec 20, 2003 at 05:43:12PM +0000, Mark Gillespie wrote:
> 
>>well, I decided to have a go at putting a 2.6 kernel together for my 
>>eden miniIITX system (currently running 2.4.23).  I compiled the kernel, 
>>and rebooted, but the kernel panics and does a stack dump.  It CPUFreq 
>>and the userspace governer seems to be the falling over point.
>>
>>Is this a know problem?  Anything I can do to work around it?
> 
> 
> I think it might be an ACPI problem again... can you do the following,
> please?
> a) write down the call trace [function names are enough]
> b) disable CONFIG_X86_ACPI_CPUFREQ and try again
> 
> Thanks, and happy holidays,
> 	Dominik
