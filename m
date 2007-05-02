From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8033] CPU loses cpufreq link after offline/online transition
Date: Wed, 2 May 2007 02:15:27 -0700
Message-ID: <200705020915.l429FRcr014595@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8033

trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED
          Component|cpufreq                     |i386
           Category|Power Management            |Platform Specific/Hardware



------- Additional Comments From trenn@suse.de  2007-05-02 02:15 -------
Thanks for verification.
Hopefully Andi or Dave can just pick the patch up.

If there is no msg the next days I'll send a little pointer to lkml for review 
and ask for integration...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
