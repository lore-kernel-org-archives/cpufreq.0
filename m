From: Dmitry Torokhov <dtor_core@ameritech.net>
Subject: Re: [ACPI] [PATCHES] ACPI Processor update [idle, throttling,
	thermal, cpufreq]
Date: Fri, 5 Sep 2003 00:23:06 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200309050023.06761.dtor_core@ameritech.net>
References: <20030904222434.GC6350@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030904222434.GC6350@brodo.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>
Cc: acpi-devel@lists.sourceforge.net, andrew.grover@intel.com, cpufreq@www.linux.org.uk

Dominik,

I have couple of concerns regarding P-states IO library, esp. 
acpi_processor_get_frequency. It seems that ACPI does not allow
to read current state without setting it first, at least with
the following code on my notebook I was always getting garbage 
in the status register:

+static int
+acpi_processor_get_current_state(
+       struct acpi_processor_performance       *perf)
+{
+       int     result = 0;
+       int     i;
+       u8      value;
+
+       ACPI_FUNCTION_TRACE("acpi_processor_get_current_state");
+
+       if (!perf->pr->flags.performance)
+               goto out;
+
+       value = inb(perf->status_register);
+
+       ACPI_DEBUG_PRINT((ACPI_DB_INFO,
+               "Got 0x%02x from port 0x%04x\n", value, perf->status_register));
+
+       for (i = 0; i < perf->state_count; i++) {
+               if (value == (u8) perf->states[i].status) {
+                       perf->state = i;
+                       goto out;
+               }
+       }
+
+       /* couldn't match our state table - garbage in status register */
+       ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
+               "Bad data 0x%02x in performance status register 0x%04x\n",
+               value, perf->status_register));
+       result = -EFAULT;
+out:
+       return_VALUE(result);
+}

I am wondering is it just me, my code or general deficiency.

Also, do you really need to do notify_transition twice 
(acpi_processor_set_performance)?

Dmitry
