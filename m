From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] CPU overheats at high frequencies,
	ACPI fails to throttle sufficiently.
Date: Sun, 11 May 2008 19:53:15 -0700 (PDT)
Message-ID: <20080512025315.85493108060@picon.linux-foundation.org>
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





------- Comment #11 from yakui.zhao@intel.com  2008-05-11 19:53 -------
From the acpidump in the comment #2 it seems that there only exists the
definition of "critical trip points temperature". And when the temperature
reaches the critical degress , OSPM will perform the criticial shutdown. 
  >Method (_CRT, 0, NotSerialized)
               {
     >              Store (0x65, Local0)
     >             Multiply (Local0, 0x0A, Local0)
     >            Add (Local0, 0x0AAC, Local0)
     >           Return (Local0)
     >      }
What Rui said in comment #8 is right. If the ACPI changes the processor
P/T-state for thermal control, the _PSL object is required, which returns the
passive coolling device list.(Of course the _PSV object is also required.) If
the ACPI turns on/off fan device for the thermal control, the _ALx object is
required, which returns the list of fan cooling device. (Of course the _ACx
object is also required).

Unfortunately the above objects doesn't exist on this laptop. And there is no
cooling device that can be used to cool the system temperature.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
