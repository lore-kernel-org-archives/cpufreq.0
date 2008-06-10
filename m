From: "Beglin, Brad R" <brad.beglin@gatech.edu>
Subject: bug? acpi p-state + ondemand keeps dropping max freq
Date: Tue, 10 Jun 2008 18:40:57 -0400 (EDT)
Message-ID: <1559428365.1484491213137657411.JavaMail.root@mail4.gatech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@lists.linux.org.uk

>I am also unable to change my max scaling frequency on my Thinkpad T61.  
>Interestingly enough, I can change the frequency as long as the new value 
>is less than 1.2 GHz.  If I try to set the new max frequency higher than that, 
>the max scaling frequency file reverts to 1.2GHz.  Here is in example:

Well, I did a lot more research, and it seems, at least in my case and probably 
others, that this is a long-time know bug, as detailed here:

http://bugzilla.kernel.org/show_bug.cgi?id=7060
http://lkml.org/lkml/2007/1/16/120
http://www.thinkwiki.org/wiki/Problem_with_CPU_frequency_scaling
http://forums.lenovo.com/lnv/board/message?board.id=T_Series_Thinkpads&thread.id=7420

However, I can report, as outlined in the Thinkwiki.org article, that adding
"processor.ignore_ppc=1" to the kernel boot parameters fixed the problem for me
(with kernel 2.6.25-r4).  

I hope this helps the others who are having the same problem. mp.

--
Brad R. Beglin
Computational Media Undergraduate
Georgia Institute of Technology 
