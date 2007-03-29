From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Thu, 29 Mar 2007 08:43:27 -0700
Message-ID: <200703291543.l2TFhR8j021145@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From dsd@gentoo.org  2007-03-29 08:43 -------
Dave,

bugme-daemon@bugzilla.kernel.org wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=8255

> Okay. I tracked down the problem with git. Here is what is the submission that
> causes the problem:
> 
> solaris linux-git # git bisect good
> 0916bd3ebb7cefdd0f432e8491abe24f4b5a101e is first bad commit
> commit 0916bd3ebb7cefdd0f432e8491abe24f4b5a101e
> Author: Dave Jones <davej@redhat.com>
> Date:   Wed Nov 22 20:42:01 2006 -0500
> 
>         [PATCH] Correct bound checking from the value returned from _PPC method.

The above commit seems to be the culprit behind this 2.6.19 regression, 
which is still present as of 2.6.21-rc3 (so it's not the earlier issue 
found by Ingo). Any ideas?

Thanks,
Daniel



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
