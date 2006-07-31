From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 8/8] acpi-cpufreq: skip duplicate frequencies
Date: Mon, 31 Jul 2006 22:58:19 +0400
Message-ID: <44CE52CB.3090104@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

 acpi-cpufreq.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

Skip duplicate frequencies reported by ACPI.

Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.15.1.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-31 21:23:47.000000000 +0400
+++ linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-31 21:36:02.000000000 +0400
@@ -22,7 +22,7 @@
  *  with this program; if not, write to the Free Software Foundation, Inc.,
  *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
  *
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
 #include <linux/config.h>
@@ -476,8 +476,14 @@
 		} else {
 			data->freq_table[i].index = i;
 		}
-		data->freq_table[i].frequency =
-		    perf->states[i].core_frequency * 1000;
+		if (i == 0 ||
+		    perf->states[i].core_frequency !=
+		    perf->states[i - 1].core_frequency) {
+			data->freq_table[i].frequency =
+			    perf->states[i].core_frequency * 1000;
+		} else {
+			data->freq_table[i].frequency = CPUFREQ_ENTRY_INVALID;
+		}
 	}
 	data->freq_table[perf->state_count].frequency = CPUFREQ_TABLE_END;
