From: Dave Jones <davej@redhat.com>
Subject: Re: post-OLS pending cpufreq patches
Date: Tue, 3 Aug 2004 14:17:29 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040803131729.GL12724@redhat.com>
References: <88056F38E9E48644A0F562A38C64FB600283BD34@scsmsx403.amr.corp.intel.com>
	<20040803124223.GB8574@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040803124223.GB8574@dominikbrodowski.de>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, cpufreq@www.linux.org.uk

On Tue, Aug 03, 2004 at 02:42:23PM +0200, Dominik Brodowski wrote:
 > On Mon, Aug 02, 2004 at 03:45:14PM -0700, Pallipadi, Venkatesh wrote:
 > > This patch was completely missing in 2004-08-02.diff. 
 > > And it needed some rework too. Here is the updated incremental patch.
 > 
 > Could you send the diff to include/acpi/processor.h as well, please, else
 > the build will fail.

Even with that, it still fails the build, with quite a few warnings.

  CC      arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o
In file included from arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:25:
include/acpi/processor.h:44: error: `ACPI_C_STATE_COUNT' undeclared here (not in a function)
include/acpi/processor.h:60: error: syntax error before "acpi_integer"
include/acpi/processor.h:60: warning: no semicolon at end of struct or union
include/acpi/processor.h:61: warning: type defaults to `int' in declaration of `power'
include/acpi/processor.h:61: warning: data definition has no type or storage class
include/acpi/processor.h:62: error: syntax error before "transition_latency"
include/acpi/processor.h:62: warning: type defaults to `int' in declaration of `transition_latency'
include/acpi/processor.h:62: warning: data definition has no type or storage class
include/acpi/processor.h:63: error: syntax error before "bus_master_latency"
include/acpi/processor.h:63: warning: type defaults to `int' in declaration of `bus_master_latency'
include/acpi/processor.h:63: warning: data definition has no type or storage class
include/acpi/processor.h:64: error: syntax error before "control"
include/acpi/processor.h:64: warning: type defaults to `int' in declaration of `control'
include/acpi/processor.h:64: warning: data definition has no type or storage class
include/acpi/processor.h:65: error: syntax error before "status"
include/acpi/processor.h:65: warning: type defaults to `int' in declaration of `status'
include/acpi/processor.h:65: warning: data definition has no type or storage class
include/acpi/processor.h:125: error: syntax error before "acpi_handle"
include/acpi/processor.h:125: warning: no semicolon at end of struct or union
include/acpi/processor.h:130: error: conflicting types for 'power'
include/acpi/processor.h:61: error: previous declaration of 'power' was here
include/acpi/processor.h:134: error: syntax error before '}' token
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c: In function `centrino_cpu_init_acpi':
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:347: error: `ACPI_PDC_EST_CAPABILITY_SMP' undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:347: error: (Each undeclared identifier is reported only once
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:347: error: for each function it appears in.)
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:347: error: `ACPI_PDC_EST_CAPABILITY_MSR' undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:370: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:370: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:370: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:370: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:376: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:376: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:382: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:382: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:382: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:382: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:384: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:384: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:397: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:397: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:406: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:406: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:407: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:407: error: dereferencing pointer to incomplete type
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:423: error: invalid use of undefined type `struct acpi_processor_px'
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:423: error: dereferencing pointer to incomplete type
{standard input}: Assembler messages:
{standard input}:341: Error: symbol `power' is already defined
make[1]: *** [arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o] Error 1
make: *** [arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o] Error 2


		Dave
