From: bugme-daemon@osdl.org
Subject: [Bug 3144] modprobe speedstep-smi fails
Date: Mon, 2 Aug 2004 13:50:58 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408022050.i72Kowg5021538@fire-1.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3144

linux@brodo.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |linux@brodo.de
             Status|NEW                         |ASSIGNED



------- Additional Comments From linux@brodo.de  2004-08-02 13:50 -------
Can you do the following to verify the issue, please?

cd /sys/devices/system/cpu/cpu0/cpufreq
cat scaling_available_governors
cat scaling_governor
cat cpuinfo_min_freq > scaling_min_freq
cat cpuinfo_max_freq > scaling_max_freq
echo -n "performance" > scaling_governor
cat scaling_governor
cat cpuinfo_cur_freq
echo -n "powersave" > scaling_governor
cat scaling_governor
cat cpuinfo_cur_freq
echo -n "performance" > scaling_governor
cat scaling_governor
cat cpuinfo_cur_freq

Thanks.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
