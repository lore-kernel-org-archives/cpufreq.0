From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: changing policy in 2.4 kernel
Date: Mon, 3 May 2004 09:50:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040503075017.GA16324@dominikbrodowski.de>
References: <Pine.GSO.4.58.0405030145320.12828@beta.math.uwaterloo.ca>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0405030145320.12828@beta.math.uwaterloo.ca>
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
To: Suihong Liang <s2liang@beta.math.uwaterloo.ca>
Cc: cpufreq@www.linux.org.uk

On Mon, May 03, 2004 at 01:48:58AM -0400, Suihong Liang wrote:
> Hi,
> 
> I just applied the patch to a 2.4.26 kernel (I think I've enabled
> related options). However, I found that the policy is "performance" and I
> couldn't change the speed. I think I have to change the policy to
> "userspace" before I can change the cpu frequency.
> 
> Could someone tell me how to change the policy?

echo -n "0%0%100%userspace" > /proc/cpufreq

	Dominik
