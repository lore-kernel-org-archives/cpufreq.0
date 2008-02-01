From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9708] powersave governor does not scale down when power gets
	connected
Date: Fri,  1 Feb 2008 05:32:15 -0800 (PST)
Message-ID: <20080201133215.36B58108018@picon.linux-foundation.org>
References: <bug-9708-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9708-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9708


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED




------- Comment #7 from trenn@suse.de  2008-02-01 05:32 -------
> PS: It seems cpufreq debugging is not visible. maybe the boot option you
> mentioned was wrong? (I'll check if necessary).
The parameter should be right. Are you sure you compiled CPU_FREQ_DEBUG into
the kernel? You can double check with:
zcat /proc/config.gz|less
Maybe it is wrong, you should find help with google...

Can you also add a debug patch (which hopefully will be mainline soon...,
Dave?), I posted it to the cpufreq list a while ago:
http://article.gmane.org/gmane.linux.kernel.cpufreq/5642

Also add another patch (I will attach it)


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
