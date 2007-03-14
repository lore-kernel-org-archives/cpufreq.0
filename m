From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS
	structure
Date: Wed, 14 Mar 2007 16:26:28 -0700
Message-ID: <200703142326.l2ENQSbL019381@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8075

trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tmcken@us.ibm.com,
                   |                            |yann@kierun.org



------- Additional Comments From trenn@suse.de  2007-03-14 16:26 -------
Can you pls attach acpidump output (best check for BIOS updates before and 
update, after doing that send acpidump output).

Yann: The kernel panics.
Why do you think this is related?
Can you give us a bit more details about the panic (last function accessed, 
best would be the whole backtrace of last processed functions).


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
