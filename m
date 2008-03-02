From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10144] Wrong cpufreq speeds detected when overclocking (speeds
	reported using stock FSB, not overclocked)
Date: Sun,  2 Mar 2008 15:17:45 -0800 (PST)
Message-ID: <20080302231745.9C5DA108067@picon.linux-foundation.org>
References: <bug-10144-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10144-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10144





------- Comment #6 from knuckles@gmail.com  2008-03-02 15:17 -------
I just confirmed, release "0902" is the latest version of the bios.

I don't know if this is related to the device you are referring, but I have an
option in the bios called "ACPI Version" that is enabled, and it's description
says "Add additional tables as per ACPI 2.0 specifications". I've tried
disabling it and the cpufreq result is the same as with it enabled.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
