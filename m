From: paul wisehart <wise@lotech.mine.nu>
Subject: 2.4.22 preempt,low-lat, _and_ cpufreq
Date: Fri, 19 Dec 2003 19:04:15 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031220000415.GA12744@kukaracha.sotano>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hey I got 2.4.22 to compile with preempt, low-lat *AND* cpufreq.
I don't know why it worked this time.

There are 2 differences that I can think of.
1) I downloaded cpufreq out of CVS with the date-modifier that would set 
   it back to a kernel 2.4.22 version.
2) I put the cpufreq patch on last. (last time i put it 1st)

Anyways the kernel compiles, and the cpufreq modules load.
Now I just have to figure out what what to do with it :)
(I haven't figures out how to control the cpufreqd daemon yet.)

I was all set to stick with a 2.6 kernel.  I have a working one installed 
and everything.  But thten I had to configure my winmodem because I'll
need a modem when Im away for xmas.  Come to find out that the lt_modem
package only works on 2.4 kernels.  That, and there was the message on 
the cpufreq about getting an older cpufreq out of CVS.

I'm not sure if its working ,but since the modules I'm pretty optimistic. 
 

-- 
paul    \  /
wisehart >/
   <//////$>
    |\|\|\
