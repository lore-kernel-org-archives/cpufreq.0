From: Alex Simonov <a_simonov@yahoo.com>
Subject: Custom powerstates table in powernow-K7 ?
Date: Sun, 19 Dec 2004 02:57:43 -0800 (PST)
Message-ID: <20041219105743.31456.qmail@web53908.mail.yahoo.com>
References: <20041218212452.DFAA849C33@nathan.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041218212452.DFAA849C33@nathan.muc.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi all,

Is there any simple way to use the powernow-k7
driver with custom PST? Until now (kernel 2.6.3)
I've always used to patch the module, hardwiring
my own PST table for my Mobile Athlon XP 1900+,
but with 2.6.8 kernels it seems more complex,
with all this ACPI stuff added to it. It is not
enough anymore to patch the 
powernow_decode_bios (int maxfid, int startvid)
function any more ..:(

Could you give me some hints please? May be there
is opportunity to pass it as a parameter to the
cpufreq module? Or a way to integrate it in the
initrd.img?


Thanks a lot in advance,

Alex


		
__________________________________ 
Do you Yahoo!? 
Read only the mail you want - Yahoo! Mail SpamGuard. 
http://promotions.yahoo.com/new_mail 
