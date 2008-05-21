From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Wed, 21 May 2008 05:26:32 -0700 (PDT)
Message-ID: <20080521122632.A431B10805D@picon.linux-foundation.org>
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





------- Comment #44 from trenn@suse.de  2008-05-21 05:26 -------
> To clarify: Matthew's updated patch in comment #35 only enables polling where
> the system has a critical trip point but no passive trip point.
This should be a lot laptops and most recent desktops.
In very rare cases you could also have several thermal zones with a critical
trip point defined.

I like the patch (when several EC reads do not take more than a second anymore
and HW access is not a concern which seem to be the case...), it makes the
whole ACPI thermal management more robust.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
