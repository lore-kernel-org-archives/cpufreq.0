From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS structure
Date: Sat,  6 Oct 2007 13:05:35 -0700 (PDT)
Message-ID: <20071006200535.BD4C9108036@picon.linux-foundation.org>
References: <bug-8075-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8075-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8075





------- Comment #22 from jim@jimbocorp.uklinux.net  2007-10-06 13:05 -------
I've now had this same problem. I've contact my motherboard manufacturer (Asus)
and they have totally failed to help.

Clearly it is a BIOS problem and the correct solution is for the BIOS to be
fixed. I'm still e-mailing Asus but I'm not hopeful.

I'm wondering if there's some way to fake the data. This would have to be done
by hard-coding the values into the module. This blatantly sucks but I can't see
any other way. This is also inappropriate for the mainline kernel as it's the
Wrong Way to do it.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
