From: paul.devriendt@amd.com
Subject: RE: ACPI / cpufreq on Presario R3120
Date: Thu, 3 Jun 2004 12:39:35 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C13FB52FA@txexmtae.amd.com>
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
To: khughes@pacific.edu, Cpufreq@www.linux.org.uk

 
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors 
> (version 1.20.08b - March 20, 2004)
> powernow-k8: Too many lo freq table entries

BIOS produces tables of frequencies/voltages that are
valid for this processor. With a K8, the lists of valid
frequencies are split up into 2 tables - the low frequency
table (<1.6GHz) and the high frequency table (>= 1.6GHz).

The hardware is unable to transition between two low
frequencies. It can only transition low-high high-low or
high-high. (See chapter 9 of the BIOS and Kernel Developers
Guide, available from www.amd.com)

The driver does not have support for the only way to go
from low to low, which is low-high-low. This is because 
BIOSs are not supposed to provide >1 entry from the low
frequency table. And this, in turn, is because AMD
processor data sheets only describe a single low frequency
state as being valid for a given part.

Therefore, you have a broken BIOS. You should report this 
to the machine manufacturer.

I suggest, as a workaround, that you set CONFIG_ACPI_PROCESSOR
in the kernel config. This will then use the ACPI objects
which hopefully are constructed correctly. (I do not think
you are currently using them, but I'm not sure, you could
check your current config).

Paul.
