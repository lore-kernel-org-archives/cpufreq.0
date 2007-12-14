From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9561] powernow-k8 cpuid c0f13 not supported w/ fx-74 CPUs
Date: Fri, 14 Dec 2007 10:08:54 -0800 (PST)
Message-ID: <20071214180854.5E46B11D107@picon.linux-foundation.org>
References: <bug-9561-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9561-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9561


mark.langsdorf@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |mark.langsdorf@amd.com
             Status|NEW                         |ASSIGNED




------- Comment #2 from mark.langsdorf@amd.com  2007-12-14 10:08 -------
Looks like it should be pretty easy to fix.  Try this patch:

--- linux-2.6.23-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.h.old   
2007-12-14 12:15:06.000000000 -0600
+++ linux-2.6.23-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.h       
2007-12-14 12:15:27.000000000 -0600
@@ -47,7 +47,7 @@ struct powernow_k8_data {
 #define CPUID_XFAM                     0x0ff00000      /* extended family */
 #define CPUID_XFAM_K8                  0
 #define CPUID_XMOD                     0x000f0000      /* extended model */
-#define CPUID_XMOD_REV_MASK            0x00080000
+#define CPUID_XMOD_REV_MASK            0x000c0000
 #define CPUID_XFAM_10H                 0x00100000      /* family 0x10 */
 #define CPUID_USE_XFAM_XMOD            0x00000f00
 #define CPUID_GET_MAX_CAPABILITIES     0x80000000


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
