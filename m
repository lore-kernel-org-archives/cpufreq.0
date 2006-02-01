From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Tue, 31 Jan 2006 20:37:06 -0800
Message-ID: <200602010437.k114b6CL027522@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5553





------- Additional Comments From miura@da-cha.org  2006-01-31 20:37 -------
It's strange!

Theodor wrote;
>cpufreq used to work with 2.6.8 and 2.6.11 kernels, but doesn't work >with
2.6.12 and 2.6.14 for me. 

and inserting printk before calling SMI BIOS solves a problem.  

But in 2.6.8, speedstep-smi driver DON'T have printk() there.
Do you use same compiler version as compiling 2.6.8 or 2.6.11? 
If the problem is this timing issue, 2.6.8 should have same problem, too.  





 


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
