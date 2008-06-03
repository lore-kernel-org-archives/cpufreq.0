From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue,  3 Jun 2008 11:40:46 -0700 (PDT)
Message-ID: <20080603184046.86B7A11D108@picon.linux-foundation.org>
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





------- Comment #48 from len.brown@intel.com  2008-06-03 11:40 -------
Phantom ACPI _PSV trip points are not how datacenter
thermal constraints will be managed.  In datacenters,
Node Manager informs the OS to stay within a maximum
P-state, and if that is insufficient, then it resorts
to a maximum T-state.  This mechanism is already in place
and already working.  And it is not dependent on Node Manager,
that is just an example of a commercial implementation.

The object of this bug report is to work-around a single instance
of a single 3-year-old notebook that has broken thermals --
while not breaking any other systems.

If we could figure out how Windows copes with this box
in the process, that might also be useful in pointing
out a gap in the Linux implementation.

So lets get this sighting dealt with and if we find a torrent
of systems such the the DMI list becomes large, then it makes
sense to consider broader deployment.

Martin,
Please attach the output from dmidecode.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
