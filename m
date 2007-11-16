From: Dave Jones <davej@redhat.com>
Subject: Re: Help with git-clone
Date: Fri, 16 Nov 2007 14:09:07 -0500
Message-ID: <20071116190907.GE32293@redhat.com>
References: <bb5d68b20711160957o204a09ecob0366b813b4eff9c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <bb5d68b20711160957o204a09ecob0366b813b4eff9c@mail.gmail.com>
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
To: claudio <claudioeddy@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Nov 16, 2007 at 01:57:19PM -0400, claudio wrote:
 > Hi, a friend of mine and I tried to git-clone
 > http://git.kernel.org/?p=linux/kernel/git/davej/cpufreq.git;a=summary and
 > got the following message:
 > 
 > "stress@cache-hit-machine:~/Desktop$ git-clone
 > http://git.kernel.org/?p=linux/kernel/git/davej/cpufreq.git;a=summary
 > Initialized empty Git repository in /home/stress/Desktop/cpufreq/.git/
 > cd: 409: can't cd to /home/stress/Desktop/cpufreq/.git/refs/remotes/origin
 > fatal: Not a valid object name HEAD"
 > 
 > Could someone tell me what's going on?
 
You're trying to git clone a web page.
Point it at the repository instead..

git clone git://git.kernel.org/pub/scm/linux/kernel/git/davej/cpufreq.git

	Dave

-- 
http://www.codemonkey.org.uk
