From: "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>
Subject: RE: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Tue, 1 Jul 2003 14:34:02 +0900
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <007101c33f92$6149afa0$6814092b@ADACHIPC>
References: <200307010144.37902.a.d.y@btinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200307010144.37902.a.d.y@btinternet.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: 'Alex Young' <a.d.y@btinternet.com>, cpufreq@www.linux.org.uk

Hi,
 
> Now my (possibly stupid) question is:
> Why are the frequency/voltage settings controlled by the bios?

It's probably because not all possible settings are necessarily
tolerable on all systems using same CPU.
System Vendors are quite careful as to which FID/VID settings they will
support on their product line.
Even if VRM is directly connected to CPU Core and thus configurable
independently of any other components on main board, still various
things such as TDP, power supply system, body size etc. must be taken
into acoount, I guess.

Thanks,
- Adachi, Kenichi
