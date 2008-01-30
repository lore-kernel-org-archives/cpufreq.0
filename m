From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9848] acpi-cpufreq: Incomplete freq list on ASUS P5N32-E SLI
	PLUS with Intel(R) Core(TM)2 Quad
Date: Wed, 30 Jan 2008 00:56:49 -0800 (PST)
Message-ID: <20080130085649.39C33108011@picon.linux-foundation.org>
References: <bug-9848-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9848-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9848





------- Comment #1 from patrol@sinus.cz  2008-01-30 00:56 -------
Created an attachment (id=14646)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=14646&action=view)
Symptoms of the bug: dmesg (with cpufreq.debug=7), /proc/cpuinfo, acpidump,
contents of /sys/devices/system/cpu/cpu0/*


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
