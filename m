From: bugme-daemon@osdl.org
Subject: [Bug 3872] Bad frequencies detected
Date: Mon, 6 Dec 2004 06:12:52 -0800
Message-ID: <200412061412.iB6ECqmv014931@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3872

linux@brodo.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |linux@brodo.de
             Status|NEW                         |ASSIGNED



------- Additional Comments From linux@brodo.de  2004-12-06 06:12 -------
p4-clockmod is useless for this processor, so that doesn't matter [and probably
you loaded it while the CPU was at 1.6GHz, then the values are correct].

The Pentium 4-M processor only supports two frequency states, so speedstep-ich
and acpi "only" reporting 1.6 GHz and 2.8GHz is correct. I'd prefer
speedstep-ich out of these two, as the BIOS exports some invalid data to the
cpufreq-acpi driver (it shouldn't export the 2.8 GHz state four times...)

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
