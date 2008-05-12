From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] CPU overheats at high frequencies,
	ACPI fails to throttle sufficiently.
Date: Mon, 12 May 2008 00:45:53 -0700 (PDT)
Message-ID: <20080512074553.4014E11D10A@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10658





------- Comment #15 from martin-kernel-bugzilla@earth.li  2008-05-12 00:45 -------
The fan on this system can be monitored and controlled via the i8k module. The
BIOS seems to do a good job of managing it by itself - it runs slow most of the
time and ramps up to high speed above about 85C - so I don't bother loading
that module and running the userspace daemons that go with it for configurable
fan control. Making that driver register a cooling device with the generic
thermal code would probably be straightforward.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
