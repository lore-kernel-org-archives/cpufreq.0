From: Nebojsa Trpkovic <trx@inbox.ru>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Sat, 16 Oct 2004 00:28:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <41704EFD.9030107@inbox.ru>
References: <200410150905.08176.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200410150905.08176.Hendrik.Muhs@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hendrik Muhs wrote:

>You found a bug! There is an error in the translation table:
>
>+/* translation table for odd multiplier to fid*/
>+static int odd_multiplier[9]={
>+    5, 7, 9, 11, 12, 13, 1, 3,        
>+   21,                                      
>+};
>
>should be (13 instead of 12, 15 instead of 13):
>
>+/* translation table for odd multiplier to fid*/
>+static int odd_multiplier[9]={
>+    5, 7, 9, 11, 13, 15, 1, 3,       
>+   21,                                      
>+};
>
>A new corrected patch is attached to this mail
>
>Hendrik
>  
>
>
That works!

Finaly I have my Barton 2500+ fully modded :D

First, I've set it's FSB from 166MHz to 200MHz (L12 mod)
and then it became Mobile (L5 mod)

Now it runs at 1GHz and switchs to 2.1GHz if needed instead of boring 
1833MHz :D


Great work!
Thank you all!
