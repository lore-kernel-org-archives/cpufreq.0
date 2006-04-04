From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6331] cpu frequency gets lowered by kernel when cord is
	pulled(init=bin/sh)
Date: Tue, 4 Apr 2006 13:59:58 -0700
Message-ID: <200604042059.k34KxwUO017394@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6331





------- Additional Comments From trenn@suse.de  2006-04-04 13:59 -------
Please try latest kernels.  
This got fixed, Dave himself checked it in :)  
The problem on these Dells is that BIOS lowers the frequency behind the kernels  
back. Later on cpufreq core detects that the speed got out of sync and gets  
confused.  
Unfortunately first approach triggered a zero division in tsc update/sync on  
longhaul therefore it is this bunch of patches:  
2006-02-02  [CPUFREQ] Check whether driver init did not initialize ...  
2006-02-02  [CPUFREQ] Check for not initialized freq on cpufreq ...  
2006-01-27  [CPUFREQ] Get rid of userspace policy struct, make ...  
2006-01-26  [CPUFREQ] _PPC frequency change issues  
  
The latest patch that I posted on cpufreq list today is also related, but you  
only should run into this if the governor is changed from userspace while  
cpufreq is limited (this one also affect all other machines doing cpufreq  
limitations).  

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
