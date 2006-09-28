From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7221] acpi_cpufreq_target calls smp_processor_id while
	preemptible
Date: Thu, 28 Sep 2006 11:32:52 -0700
Message-ID: <200609281832.k8SIWqsO024792@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7221

venkatesh.pallipadi@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEW                         |ASSIGNED



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
