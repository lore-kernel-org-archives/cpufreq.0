From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9745] CPU is waking up too often
Date: Mon, 14 Jan 2008 07:01:51 -0800 (PST)
Message-ID: <20080114150151.9B7D310806D@picon.linux-foundation.org>
References: <bug-9745-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9745-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9745





------- Comment #13 from trenn@suse.de  2008-01-14 07:01 -------
Then a workaround for you should be processor.max_cstate=2 boot param, if this
does not help processor.max_cstate=1.
But it would be great to know more about the root cause (and get this fixed to
fully support the C-states).
Could you try to keep processor driver without max_cstate workaround and
blacklist yenta_socket, e.g. add a line:
install yenta_socket /bin/echo "Yenta socket blacklisted, it will not get
loaded"
to /etc/modprobe.conf
I already asked Arjan about the yenta_socket problem and he said it would be
the yenta driver's fault... As there seem to be quite some people affected, it
would be great to bring them together and find out a bit more about the problem
(Did this machine ever worked correctly with C-states? If yes, one might want
to start a git bisect...).


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
