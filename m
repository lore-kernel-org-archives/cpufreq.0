From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] CPU overheats at high frequencies,
	ondemand governor fails to throttle sufficiently.
Date: Sun, 11 May 2008 10:09:38 -0700 (PDT)
Message-ID: <20080511170938.C2273108035@picon.linux-foundation.org>
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





------- Comment #5 from martin-kernel-bugzilla@earth.li  2008-05-11 10:09 -------
From /proc/acpi/thermal_zone/THM:

cooling_mode: <setting not supported>
polling_frequency: <polling disabled>
state: state: ok
temperature: temperature: 60 C
trip_points: critical (S5): 101 C

The reported temperature does climb to the trip point.

Some throttling clearly does kick in when fully loaded using ondemand, as the
frequency drops to 1.6GHz for a bit, and the temperature drops back into the
90s. As soon as it does though, the frequency jumps back to 2GHz. Eventually
everything heats up sufficiently that the short drops in frequency aren't
enough to keep the core under the limit when it goes back to 2GHz.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
