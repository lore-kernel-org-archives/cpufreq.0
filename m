From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Sat, 21 Jan 2006 13:21:37 -0800
Message-ID: <200601212121.k0LLLb7q014374@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5553





------- Additional Comments From tm@del.bg  2006-01-21 13:21 -------
Unfortunately the patch in attachment id 6973 did not solve the problem. I've 
tryed to nail down the time critical place by changing dprintk()s to printk() 
one by one. speedstep-smi is working for me with the changes in the attached 
patch. 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
