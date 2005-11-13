From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Sun, 13 Nov 2005 06:13:23 -0800
Message-ID: <200511131413.jADEDNjp025148@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5553





------- Additional Comments From tm@del.bg  2005-11-13 06:08 -------
With the patch provided by Andrew Morton:

CONFIG_CPU_FREQ_DEBUG=n

# modprobe speedstep-smi
FATAL: Error inserting speedstep_smi (/.../speedstep-smi.ko): No such device
kernel: sig=47534943, smi_port=0, smi_cmd=0

# modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82
FATAL: Error inserting speedstep_smi (/.../speedstep-smi.ko): No such device
kernel: sig=47534943, smi_port=178, smi_cmd=130

As per venkatesh.pallipadi at intel comments I've tried:

# for i in `seq 1 100`; do modprobe speedstep-smi ;done

But still no go.

---

CONFIG_CPU_FREQ_DEBUG=y

# modprobe speedstep-smi
kernel: sig=47534943, smi_port=0, smi_cmd=0

# rmmod speedstep-smi

# modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82
kernel: sig=47534943, smi_port=178, smi_cmd=130

With debug enabled it just works.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
